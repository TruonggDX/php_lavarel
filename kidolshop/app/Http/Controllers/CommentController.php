<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Viewer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class CommentController extends Controller
{
    // admin

    // Kiểm tra đăng nhập
    public function checkLogin(){
        $idAdmin = Session::get('idAdmin');
        if($idAdmin == false) return Redirect::to('admin')->send();
    }

    // Chuyển đến trang quản lý bài viết
    public function manage_comment(){
        $this->checkLogin();

        // Lấy danh sách sản phẩm đã được đánh giá từ bảng viewer
        $comments = DB::table('viewer')
            ->join('product', 'viewer.idProduct', '=', 'product.idProduct')
            ->leftJoin('customer', 'viewer.idCustomer', '=', 'customer.idCustomer')
            ->select(
                'viewer.idView',
                'product.ProductName',
                'viewer.Rating',
                'viewer.Comment',
                'viewer.created_at',
                'customer.username')
            ->groupBy(
                'viewer.idView',
                'product.ProductName',
                'viewer.Rating',
                'viewer.Comment',
                'viewer.created_at',
                'customer.username',
            )
            ->orderBy('viewer.created_at', 'desc')
            ->paginate(5);
        $count_comment = Viewer::count();
        return view("admin.comment.manage-comment", compact('comments','count_comment'));

    }
    public function delete_comment($idView)
    {
        $this->checkLogin();

        // Xóa bình luận theo ID
        $comment = Viewer::find($idView);

        if ($comment) {
            $comment->delete();
            return Redirect()->back()->with('success', 'Xóa bình luận thành công!');
        } else {
            return Redirect()->back()->with('error', 'Không tìm thấy bình luận!');
        }
    }

    //customer

    public function add_comment(Request $request)
    {
        $idCustomer = Session::get('idCustomer');

        if (!$idCustomer) {
            return redirect()->back()->with('error', 'Bạn cần đăng nhập để thêm bình luận!');
        }

        // Kiểm tra dữ liệu đầu vào
        $request->validate([
            'idProduct' => 'required|exists:product,idProduct',
            'Rating' => 'required|integer|min:1|max:5',
            'Comment' => 'nullable|string|max:1000'
        ]);

        // Thêm bình luận vào database
        Viewer::create([
            'idProduct' => $request->idProduct,
            'idCustomer' => $idCustomer,
            'Rating' => $request->Rating,
            'Comment' => $request->Comment
        ]);

        return redirect()->back()->with('success', 'Thêm đánh giá thành công!');
    }






    public function get_comments_by_product_name($productName)
    {
        $productName = urldecode(base64_decode($productName)); // Giải mã tên sản phẩm

        \Log::info('ProductName nhận được:', ['productName' => $productName]);

        if (!$productName) {
            return response()->json(['error' => 'Tên sản phẩm không hợp lệ!'], 400);
        }

        $product = Product::where('ProductName', 'LIKE', '%' . $productName . '%')->first();

        if (!$product) {
            return response()->json(['error' => 'Sản phẩm không tồn tại!'], 404);
        }

        $comments = Viewer::where('idProduct', $product->idProduct)
            ->join('customer', 'viewer.idCustomer', '=', 'customer.idCustomer')
            ->select('viewer.idView', 'viewer.Rating', 'viewer.Comment', 'viewer.created_at', 'customer.username')
            ->orderBy('viewer.created_at', 'desc')
            ->get();

        return response()->json($comments);
    }

    public function delete_commentCus($idView)
    {
        try {
            $comment = Viewer::find($idView);

            if (!$comment) {
                return response()->json(['error' => 'Không tìm thấy bình luận!'], 404);
            }

            $comment->delete();
            return response()->json(['success' => 'Xóa bình luận thành công!'], 200);
        } catch (\Exception $e) {
            \Log::error('Lỗi khi xóa bình luận:', ['error' => $e->getMessage()]);
            return response()->json(['error' => 'Lỗi server!'], 500);
        }
    }

    public function update_comment(Request $request, $id)
    {
        $comment = Viewer::find($id);

        if (!$comment) {
            return response()->json(['error' => 'Bình luận không tồn tại!'], 404);
        }

        $comment->Comment = $request->comment;
        $comment->Rating = $request->rating;
        $comment->save();

        return response()->json(['success' => true, 'message' => 'Cập nhật bình luận thành công!']);
    }

}
