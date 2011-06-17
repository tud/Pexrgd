# == Schema Information
#
# Table name: drawings
#
#  id           :integer         not null, primary key
#  drawing_type :string(2)
#  number       :string(10)      not null
#  rev          :string(2)
#  format       :string(2)
#  sheet        :string(5)
#  descr        :string(25)
#  title        :string(25)
#  assembly     :string(20)
#  designer     :string(5)
#  area         :string(6)
#  created_at   :string(8)
#  cad_flag     :string(2)
#  void_mark    :string(5)
#  voided_at    :string(8)
#  replaced_by  :string(20)
#  change_descr :string(50)
#  modified_by  :string(5)
#  modified_at  :string(8)
#  bom_flag     :string(1)
#

class Drawing < ActiveRecord::Base
  scope :distinct_number, group(:number)
  scope :distinct_rev, group(:rev)
  scope :distinct_format, group(:format)
  scope :distinct_descr, group(:descr)
  scope :distinct_designer, group(:designer)
end
