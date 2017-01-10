# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170104183434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bai_post_loai_mon_ans", force: :cascade do |t|
    t.integer "bai_posts_id"
    t.integer "loai_mon_ans_id"
    t.index ["bai_posts_id"], name: "index_bai_post_loai_mon_ans_on_bai_posts_id", using: :btree
    t.index ["loai_mon_ans_id"], name: "index_bai_post_loai_mon_ans_on_loai_mon_ans_id", using: :btree
  end

  create_table "bai_posts", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "TenMonAn"
    t.string   "CongThucCheBien"
    t.string   "ThanhPhan"
    t.money    "Gia",             scale: 2
    t.string   "ThoiGianNau"
    t.string   "HanSuDung"
    t.string   "ThongTinPhu"
    t.string   "DiaChiNguoiBan"
    t.string   "TrangThai"
    t.binary   "Hinh1"
    t.binary   "Hinh2"
    t.binary   "Hinh3"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "foodimage"
    t.index ["member_id"], name: "index_bai_posts_on_member_id", using: :btree
  end

  create_table "buoi_trong_ngays", force: :cascade do |t|
    t.string  "TenBuoi"
    t.integer "ThoiGianBatDau"
    t.integer "ThoiGianKetThuc"
  end

  create_table "chi_tiet_giao_hangs", force: :cascade do |t|
    t.integer  "xes_id"
    t.integer  "hoa_dons_id"
    t.integer  "bai_posts_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "buoi_trong_ngays_id"
    t.index ["bai_posts_id"], name: "index_chi_tiet_giao_hangs_on_bai_posts_id", using: :btree
    t.index ["buoi_trong_ngays_id"], name: "index_chi_tiet_giao_hangs_on_buoi_trong_ngays_id", using: :btree
    t.index ["hoa_dons_id"], name: "index_chi_tiet_giao_hangs_on_hoa_dons_id", using: :btree
    t.index ["xes_id"], name: "index_chi_tiet_giao_hangs_on_xes_id", using: :btree
  end

  create_table "chi_tiet_hoa_dons", force: :cascade do |t|
    t.integer  "hoa_don_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "SoLuong"
    t.money    "ThanhTien",    scale: 2
    t.integer  "bai_posts_id"
    t.index ["bai_posts_id"], name: "index_chi_tiet_hoa_dons_on_bai_posts_id", using: :btree
    t.index ["hoa_don_id"], name: "index_chi_tiet_hoa_dons_on_hoa_don_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "hoa_don_id"
    t.integer  "member_id"
    t.string   "NoiDungComment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hoa_don_id"], name: "index_comments_on_hoa_don_id", using: :btree
    t.index ["member_id"], name: "index_comments_on_member_id", using: :btree
  end

  create_table "dia_chis", force: :cascade do |t|
    t.integer "member_id"
    t.string  "SoNha"
    t.string  "Quan"
    t.string  "ThanhPho"
    t.index ["member_id"], name: "index_dia_chis_on_member_id", using: :btree
  end

  create_table "dia_diems", force: :cascade do |t|
    t.string   "XuatPhat"
    t.string   "Dich"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "KhoangCach"
  end

  create_table "hoa_dons", force: :cascade do |t|
    t.datetime "NgayDatHang"
    t.string   "DiaChiNguoiBan"
    t.string   "DiaChiNguoiMua"
    t.money    "TongTien",       scale: 2
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "nguoiban_id"
    t.integer  "nguoimua_id"
  end

  create_table "lich_giao_hangs", force: :cascade do |t|
    t.integer "hoa_dons_id"
    t.string  "TrangThai"
    t.index ["hoa_dons_id"], name: "index_lich_giao_hangs_on_hoa_dons_id", using: :btree
  end

  create_table "loai_mon_ans", force: :cascade do |t|
    t.string "TenLoaiMonAn"
  end

  create_table "members", force: :cascade do |t|
    t.string   "HoTen"
    t.string   "Password"
    t.string   "Email"
    t.string   "SoDT"
    t.string   "LoaiMXH"
    t.integer  "SoMonAnCoTheNauTrongNgay"
    t.string   "uid"
    t.boolean  "BanHang"
    t.datetime "NgayHetHan"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "bai_post_id"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bai_post_id"], name: "index_reports_on_bai_post_id", using: :btree
    t.index ["member_id"], name: "index_reports_on_member_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "bai_post_id"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "SoSao"
    t.index ["bai_post_id"], name: "index_reviews_on_bai_post_id", using: :btree
    t.index ["member_id"], name: "index_reviews_on_member_id", using: :btree
  end

  create_table "thoi_gian_phuc_vus", force: :cascade do |t|
    t.integer "members_id"
    t.integer "ThoiGianBatDau"
    t.integer "ThoiGianKetThuc"
    t.index ["members_id"], name: "index_thoi_gian_phuc_vus_on_members_id", using: :btree
  end

  create_table "thong_baos", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "NoiDung"
    t.integer  "nguoinhan_id"
    t.integer  "nguoigui_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "SDT"
    t.string   "password"
    t.string   "password_comfirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password_digest"
  end

  create_table "xes", force: :cascade do |t|
    t.string "MaSoXe"
    t.string "TrangThai"
  end

  add_foreign_key "bai_post_loai_mon_ans", "bai_posts", column: "bai_posts_id"
  add_foreign_key "bai_post_loai_mon_ans", "loai_mon_ans", column: "loai_mon_ans_id"
  add_foreign_key "bai_posts", "members"
  add_foreign_key "chi_tiet_hoa_dons", "hoa_dons"
  add_foreign_key "comments", "hoa_dons"
  add_foreign_key "comments", "members"
  add_foreign_key "reports", "bai_posts"
  add_foreign_key "reports", "members"
  add_foreign_key "reviews", "bai_posts"
  add_foreign_key "reviews", "members"
end
