<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateViewerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('viewer', function (Blueprint $table) {
            $table->id('idView'); // Khóa chính
            $table->unsignedBigInteger('idCustomer'); // ID khách hàng
            $table->unsignedBigInteger('idProduct'); // ID sản phẩm
            $table->integer('Rating')->nullable(); // Số sao (từ 1 - 5)
            $table->text('Comment')->nullable(); // Nội dung đánh giá
            $table->timestamps(); // Ngày tạo và cập nhật tự động

            // Khóa ngoại
            $table->foreign('idCustomer')->references('id')->on('customers')->onDelete('cascade');
            $table->foreign('idProduct')->references('idProduct')->on('product')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('viewer');
    }
}
