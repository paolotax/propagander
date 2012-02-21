class Cliente < ActiveRecord::Base
  
  TIPI_CLIENTI = ['Scuola Primaria', 'Istituto Comprensivo', 'Direzione Didattica', 'Cartolibreria', 'Persona Fisica', 'Ditta', 'Comune']
  ABBR_TIPI    = ['E', 'IC', 'D', 'C', '', '', 'Com']
  
  
  has_many :appunti
  
  
  def calculate_tipo_and_nome
    
    if ( self.titolo =~ /^E (.*)/ )
      self.cliente_tipo = "Scuola Primaria"
    end
    
    if ( self.titolo =~ /^D (.*)/ )
      self.cliente_tipo = "Direzione Didattica"
    end
    
    if ( self.titolo =~ /^C (.*)/ )
      self.cliente_tipo = "Cartolibreria"
    end
    
    if ( self.titolo =~ /^IC (.*)/ )
      self.cliente_tipo = "Istituto Comprensivo"
    end
    
    if ( self.titolo =~ /(^G (.*))|(^P (.*))/ )
      self.cliente_tipo = "Persona Fisica"
    end
    
    if ( self.titolo =~ /^Z (.*)/ )
      self.cliente_tipo = "Ditta"
    end
    
    self.save
    
  end
  
  
end
