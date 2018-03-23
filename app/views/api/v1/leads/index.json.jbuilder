json.array!  @leads.each do |lead|
  json.(lead, :id, :first_name, :last_name, :email, :phone, :ip, :city, :state,
  :zip, :contacted, :appointment_date, :created_at, :updated_at, :processed_within_minutes, :hot, :has_outreaches, :event_since_last_outreach)
  json.clicked false
  json.events lead.events, :id, :lead_id, :name, :created_at, :updated_at
end