@extends('admin_layout')
@section('content_dash')

    <div class="content-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                        <div>
                            <h4 class="mb-3">Danh Sách Đánh Giá Sản Phẩm( Tổng: {{$count_comment}} đánh giá )</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="table-responsive rounded mb-3">
                        <table class="data-table table mb-0 tbl-server-info">
                            <thead class="bg-white text-uppercase">
                            <tr class="ligth ligth-data">
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Số sao</th>
                                <th>Nội dung đánh giá</th>
                                <th>Người đánh giá</th>
                                <th>Ngày đánh giá</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($comments as $comment)
                                <tr>
                                    <td>{{ $comment->idView }}</td>
                                    <td>{{ $comment->ProductName }}</td>
                                    <td>{{$comment -> Rating}} <i class="fas fa-star text-warning"></i></td>
                                    <td>{{ $comment->Comment }}</td>
                                    <td>{{ $comment->username }}</td>
                                    <td>{{ date('d/m/Y H:i', strtotime($comment->created_at)) }}</td>
                                    <td>
{{--                                        <a href="{{ route('admin.comment.delete', $comment->idView) }}"--}}
{{--                                           class="badge bg-danger mr-2"--}}
{{--                                           onclick="return confirm('Bạn có chắc chắn muốn xóa bình luận này?')"--}}
{{--                                           data-toggle="tooltip" data-placement="top" title="Xóa">--}}
{{--                                            <i class="ri-delete-bin-line mr-0"></i>--}}
{{--                                        </a>--}}
                                        <a class="badge bg-warning mr-2" data-toggle="modal" data-tooltip="tooltip" data-target="#modal-delete-{{$comment->idView}}" data-placement="top" title="Xóa" data-original-title="Xóa"
                                           style="cursor:pointer;"><i class="ri-delete-bin-line mr-0"></i></a>

                                    </td>

                                </tr>


                                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="modal-delete-{{$comment->idView}}"  aria-hidden="true">
                                    <div style="width: 330px" class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Thông báo</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Bạn có muốn xóa đánh giá này không?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-light" data-dismiss="modal">Trở về</button>
                                                <a href="{{URL::to('/delete-comment/'.$comment->idView)}}" type="button" class="btn btn-primary">Xác nhận</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                            </tbody>

                        </table>

                    </div>
                    <div class="d-flex justify-content-end">
                        {{ $comments->appends(request()->query())->links('pagination::bootstrap-4') }}
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection
