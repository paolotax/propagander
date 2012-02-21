collection @appunti

attributes :id, :destinatario, :note, :cliente_titolo, :stato, :cliente_id

code do |d| 
  # { data: time_ago_in_words(d.created_at) }
  { data: d.created_at, cliente_tipo: d.cliente.cliente_tipo.parameterize }
end