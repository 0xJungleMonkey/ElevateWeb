require 'pg'
require 'mysql2'
def leadsconvert
    Lead.all.each do |l|
        FactContact.create!(
        {
            contactid: l.id,
            creationdate: l.Creation_date,
            companyname: l.Bussiness_name,
            email: l.Email,
            projectname: l.Project_name,
        }
    )
    end
end
leadsconvert();
puts "Fact_contact Seeded #{FactContact.count} Record"
def quotesconvert
    Quote.all.each do |q|
        lead = Lead.find(q.id)
        factquote=FactQuote.create!(
            {
                quoteid: q.id,
                nbelevator: q.number_of_elevators_needed,
                creation: lead.Creation_date,
                companyname: lead.Bussiness_name,
                email: lead.Email,

            }
        )
        
    end
end
quotesconvert();
puts "Fact_Quote Seeded #{FactQuote.count} Record"
def customersconvert
    Customer.all.each do |c|
        i = 0
        c.buildings.all.each do |b|
            b.batteries.all.each do |bt|
                bt.columns.all.each do |co|
                    co.elevators.all.each do
                        i += 1
                    end
                end
            end
        end

        DimCustomer.create!(
            {
            creationdate: c.date,
            companyname: c.CompanyName,
            fullnameofcompanymaincontact: c.FullNameOfCompanyContact,
            emailofcompanymaincontact: c.CompanyContactEMail,
            customercity: c.CompanyHQAdress,
            nbelevators: i
            }
            
        )


    end
end
customersconvert();
puts "DimCust Seeded #{DimCustomer.count} Record"
def elevatorsconvert
    Elevator.all.each do |e|
        # c = Column.find(e.column_id)
        # bt = Battery.find(c.battery_id)
        # b = Building.find(bt.id)
       
        # puts b.id
        # cs = Customer.find(b.id)
        # a = Address.find(cs.id)

#             building_id: 
#             customer_id:
#             building_city:
        FactElevator.create!(
            {
                serial_number: e.SerialNumber,
                date_of_commissioning: e.CommisionDate,
                building_id: Battery.find(Column.find(e.column_id).battery_id).building_id,
                customer_id: Building.find(Battery.find(Column.find(e.column_id).battery_id).building_id).customer_id,
                building_city: Address.find(Building.find(Battery.find(Column.find(e.column_id).battery_id).building_id).address_id).city
            }
           )
    end
end
elevatorsconvert;
puts "Fact_elevator Seeded #{FactElevator.count} Record"
    



