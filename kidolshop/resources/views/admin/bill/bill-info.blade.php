@extends('admin_layout')
@section('content_dash')

    <div class="content-page">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-block card-stretch card-height print rounded">
                        <div class="card-header d-flex justify-content-between bg-primary header-invoice">
                            <div class="iq-header-title">
                                <h4 class="card-title mb-0">Đơn hàng #{{$address->idBill}}</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th scope="col">Họ và tên người nhận</th>
                                                <th scope="col">Số điện thoại</th>
                                                <th scope="col">Địa chỉ</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td style="padding-left:12px !important;">{{$address->CustomerName}}</td>
                                                <td style="padding-left:12px !important;">{{$address->PhoneNumber}}</td>
                                                <td style="padding-left:12px !important;">{{$address->Address}}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <h5 class="mb-3">Chi tiết đơn hàng</h5>
                                    <div class="table-responsive-sm">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th class="text-center" scope="col">STT</th>
                                                <th scope="col">Sản phẩm</th>
                                                <th class="text-center" scope="col">Giá</th>
                                                <th class="text-center" scope="col">Số lượng</th>
                                                <th class="text-center" scope="col">Tổng</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php $Total = 0; $ship = 0; $total_bill = 0; $discount = 0; ?>
                                            @foreach($list_bill_info as $key => $bill_info)
                                                    <?php $Total += ($bill_info->Price * $bill_info->QuantityBuy); ?>
                                                <tr>
                                                    <th class="text-center" scope="row">{{$key + 1}}</th>
                                                    <td class="row" style="border-bottom:0;">
                                                            <?php $image = json_decode($bill_info->ImageName)[0]; ?>
                                                        <img class="avatar-70 rounded"
                                                             src="{{asset('storage/kidoldash/images/product/'.$image)}}"
                                                             alt="">
                                                        <div class="ml-2" style="flex:1;">
                                                            <h6 class="mb-0">{{$bill_info->ProductName}}</h6>
                                                            <p class="mb-0">Mã sản phẩm: {{$bill_info->idProduct}}</p>
                                                            <span>{{$bill_info->AttributeProduct}}</span>
                                                        </div>
                                                    </td>
                                                    <td class="text-center"
                                                        style="border-bottom:0;">{{number_format($bill_info->Price,0,',','.')}}
                                                        đ
                                                    </td>
                                                    <td class="text-center"
                                                        style="border-bottom:0;">{{$bill_info->QuantityBuy}}</td>
                                                    <td class="text-center" style="border-bottom:0;">
                                                        <b>{{number_format($bill_info->Price * $bill_info->QuantityBuy,0,',','.')}}
                                                            đ</b></td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 mb-3">
                                <div class="col-lg-6">
                                    <h5>Trạng thái đơn hàng:</h5>
                                </div>
                                <div class="col-lg-6">
                                    <select id="orderStatus" class="form-control" data-id="{{$address->idBill}}">
                                        <option value="0" {{$address->Status == 0 ? 'selected' : ''}}>Chờ xác nhận
                                        </option>
                                        <option value="1" {{$address->Status == 1 ? 'selected' : ''}}>Đang giao</option>
                                    </select>
                                </div>
                            </div>


                            <div class="row mt-4 mb-3">
                                <div class="col-lg-12">
                                    <div class="or-detail rounded">
                                        <div class="p-3 row">
                                            <h5 class="mb-3 col-lg-12">Order Details</h5>
                                            <div class="mb-2 col-lg-10">
                                                <h6>Tổng tiền hàng</h6>
                                            </div>
                                            <div class="mb-2 col-lg-2 text-right">
                                                <h6>{{number_format($Total,0,',','.')}}đ</h6>
                                            </div>

                                            @if($Total < 1000000)
                                                @php $ship = '30000'; $total_bill = $Total + $ship; @endphp
                                            @else
                                                @php $ship = 'Miễn phí'; $total_bill = $Total; @endphp
                                            @endif
                                            <div class="mb-2 col-lg-10">
                                                <h6>Phí vận chuyển (Miễn phí vận chuyển cho đơn hàng trên
                                                    1.000.000đ)</h6>
                                            </div>
                                            <div class="mb-2 col-lg-2 text-right">
                                                <h6>   @if($ship > 0)
                                                        {{ number_format((float)$ship, 0, ',', '.') }}đ
                                                    @else
                                                        {{ (float)$ship }}
                                                    @endif

                                                </h6>
                                            </div>

                                            @if($address->Voucher != '')
                                                <div class="mb-2 col-lg-10">
                                                    <h6>Mã giảm giá</h6>
                                                </div>
                                                @php
                                                    $Voucher = explode("-",$address->Voucher);
                                                    $VoucherCondition = $Voucher[1];
                                                    $VoucherNumber = $Voucher[2];
                                                    if($VoucherCondition == 1) $discount = ($Total/100) * $VoucherNumber;
                                                    else{
                                                        $discount = $VoucherNumber;
                                                        if($discount > $Total) $discount = $Total;
                                                    }

                                                    $total_bill =  $total_bill - $discount;
                                                    if($total_bill < 0) $total_bill = $ship;
                                                @endphp
                                                <div class="mb-2 col-lg-2 text-right">
                                                    <h6>- {{number_format($discount,0,',','.')}}đ</h6>
                                                </div>
                                            @endif
                                        </div>
                                        <div
                                            class="ttl-amt py-2 px-3 d-flex justify-content-between align-items-center">
                                            <h6>Thành tiền</h6>
                                            <h3 class="text-primary font-weight-700">{{number_format($total_bill,0,',','.')}}
                                                đ</h3>
                                        </div>
                                    </div>
                                    @if($address->Payment == 'vnpay')
                                        <div class="col-lg-3 paid_tag">
                                            <div class="h3 p-3 mb-0 text-primary">Đã thanh toán</div>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('orderStatus').addEventListener('change', function () {
            let idBill = this.getAttribute('data-id');
            let status = this.value;

            fetch(`/admin/update-status/${idBill}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({status: status})
            })
                .then(response => response.json())
                .then(data => alert(data.message))
                .catch(error => console.error('Error:', error));
        });
    </script>

@endsection
