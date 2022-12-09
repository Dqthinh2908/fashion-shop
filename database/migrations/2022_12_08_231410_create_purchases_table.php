<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('purchases'))
        {
            Schema::create('purchases', function (Blueprint $table) {
                $table->id();
                $table->integer('product_id');
                $table->timestamp('date_import');
                $table->string('quantity');
                $table->string('price');
                $table->timestamps();
        });
        }

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases');
    }
}
