<?php

use Illuminate\Database\Seeder;

class CreateRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('roles')->insert([
            ['name'=>'super admin','description'=>'Quản trị hệ thống'],
            ['name'=>'staff','description'=>'Nhân viên'],
            ['name'=>'developer','description'=>'Phát triển hệ thống'],
        ]);
    }
}
