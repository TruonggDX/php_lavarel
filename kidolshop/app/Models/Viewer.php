<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Viewer extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $table = 'viewer';
    protected $primaryKey = 'idView';

    protected $fillable = [
        'idCustomer',
        'idProduct',
        'Rating',
        'Comment',
        'created_at',
        'updated_at'
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'idCustomer', 'idCustomer');
    }
    public function product()
    {
        return $this->belongsTo(Product::class, 'idProduct', 'idProduct');
    }
}
