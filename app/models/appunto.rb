class Appunto < ActiveRecord::Base
  belongs_to :cliente
  
  validates :cliente_titolo,  :presence => true
  
  scope :recente,  order("appunti.id desc")
  scope :in_corso,   includes(:cliente).where("appunti.stato <> 'X'")
  scope :completo,   includes(:cliente).where("appunti.stato = 'X'")
  scope :da_fare,    includes(:cliente).where("appunti.stato = ''")
  scope :in_sospeso, includes(:cliente).where("appunti.stato = 'P'")
  
  scope :uniq_cliente_id, select(:cliente_id).uniq
  
  scope :recente_da_data, lambda { |data| includes(:cliente).where("appunti.stato <> 'X' or appunti.updated_at >= ?", data)  }
  scope :un_anno, lambda {  includes(:cliente).where("appunti.stato <> 'X' or appunti.updated_at >= ?",  1.year.ago)  }
  
  def cliente_titolo
    cliente.titolo if cliente.present?
  end
end
