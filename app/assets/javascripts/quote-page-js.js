document.addEventListener('DOMContentLoaded', function(e) {
const registration = document.getElementById('registration')
const building_type = document.getElementById('building-type')
const quality = document.getElementById('quality')

// hide & shows
const apartment_number_input_container = document.getElementById('apartment-number-input-container')
const floor_number_input_container = document.getElementById('floor-number-input-container')
const basement_number_input_container = document.getElementById('basement-number-input-container')
const business_number_input_container = document.getElementById('business-number-input-container')
const parking_number_input_container = document.getElementById('parking-number-input-container')
const cage_number_input_container = document.getElementById('cage-number-input-container')
const occupant_number_input_container = document.getElementById('occupants-number-input-container')
const hour_number_input_container = document.getElementById('hour-number-input-container')

// output containers
const elevators_needed_output_container = document.getElementById('elevators-needed-output-container')
const unit_price_output_container = document.getElementById('unit-price-output-container')
const elevator_price_output_container = document.getElementById('elevator-price-output-container')
const installation_fee_output_container = document.getElementById('installation-fee-output-container')
const final_price_output_container = document.getElementById('final-price-output-container')

// inputs
const apartment_input = document.getElementById("apartment-input")
const floor_input = document.getElementById("floor-input")
const business_input = document.getElementById("business-input")
const basement_input = document.getElementById('basement-input')
const parking_input = document.getElementById("parking-input")
const cage_input = document.getElementById("cage-input")
const occupants_input = document.getElementById("occupants-input")
const hour_input = document.getElementById("hour-input")



// outputs
const elevators_needed = document.getElementById('elevators-needed')
const unit_price = document.getElementById('unit-price')
const elevator_price = document.getElementById('elevator-price')
const installation_fee = document.getElementById('installation-fee')
const final_price = document.getElementById('final-price')


function hideFields(){
    apartment_number_input_container.style.display = "none"
    floor_number_input_container.style.display = "none"
    basement_number_input_container.style.display = "none"
    business_number_input_container.style.display = "none"
    parking_number_input_container.style.display = "none"
    cage_number_input_container.style.display = "none"
    occupant_number_input_container.style.display = "none"
    hour_number_input_container.style.display = "none"
}
function clearFields(){
   apartment_input.value = " "
   floor_input.value = " "
   basement_input.value = " "
   business_input.value = " "
   parking_input.value = " "
   cage_input.value = " "
   occupants_input.value  = " "
   hour_input.value = " "
}

hideFields()


building_type.addEventListener('click', (e) => {

    if (e.target.id === "residential") {
        hideFields()
        clearFields()
    apartment_number_input_container.style.display = "block"
    floor_number_input_container.style.display = "block"
    basement_number_input_container.style.display = "block"
    resEleAmount()
    residentialMath()
    elePrice()
    }
    else if (e.target.id === "commercial") {
        hideFields()
        clearFields()
    business_number_input_container.style.display = "block"
    floor_number_input_container.style.display = "block"
    basement_number_input_container.style.display = "block"
    parking_number_input_container.style.display = "block"
    cage_number_input_container.style.display = "block"
    commercialMath()
    comTotal()
    elePrice()
    }

    else if (e.target.id === "corporate") {
        hideFields()
        clearFields()
    business_number_input_container.style.display = "block"
    basement_number_input_container.style.display = "block"
    parking_number_input_container.style.display = "block"
    occupant_number_input_container.style.display = "block"
    floor_number_input_container.style.display = "block"
    corEleAmount()
    corporateMath
    elePrice()
    }

    else if (e.target.id === "hybrid") {
        hideFields()
        clearFields()
    business_number_input_container.style.display = "block"
    floor_number_input_container.style.display = "block"
    basement_number_input_container.style.display = "block"
    parking_number_input_container.style.display = "block"
    occupant_number_input_container.style.display = "block"
    hour_number_input_container.style.display = "block"
    hybridEleAmount()
    hybridMath()
    elePrice()
    }
})
const dollars = new Intl.NumberFormat(`en-US`, {
    currency: `USD`,
    style: 'currency',
})


quality.addEventListener ('click', (e) => {
    if (e.target.id === "standard") {
        unit_price.value = dollars.format(7565)
        installation_fee.value = 10 + "%" 
        elePrice()
    }

    else if (e.target.id === "premium") {
        unit_price.value = dollars.format(12345)
        installation_fee.value = 13 + "%"
        elePrice()
    }

    else if (e.target.id === "excelium") {
        unit_price.value = dollars.format(15400)
        installation_fee.value = 16 + "%"
        elePrice()
    }

})

// ELEVATORS NEEDED=============

function residentialMath(){
    let  column_number = Math.ceil (floor_input.value / 20)
    let  apt_average = Math.ceil (apartment_input.value / floor_input.value)
    let  shaft_number = Math.ceil (apt_average / 6)
    elevators_needed.value = shaft_number * column_number
}

function resEleAmount(){
    apartment_input.addEventListener("input", () => {
        residentialMath()
        elePrice()
    })
    floor_input.addEventListener("input", () => {
        residentialMath()
        elePrice()
    })
    }

function commercialMath(){
    cage_input.addEventListener("input", () => {
    elevators_needed.value = cage_input.value
    elePrice()

})
}
function comTotal(){
    quality.addEventListener("click", () => {
    elePrice()

})
}

function corporateMath(){
        let  total_floors = +(floor_input.value) + +(basement_input.value)
        let  column_number = total_floors / 20
        let  total_occupants = +(occupants_input.value) * total_floors
        let  elevator_required = total_occupants / 1000
        let  elevator_column = elevator_required / column_number
        elevators_needed.value = Math.ceil (elevator_column * column_number)
} 

function corEleAmount() {
    basement_input.addEventListener('input', () => {
        corporateMath()
        elePrice()
    })

    occupants_input.addEventListener('input', () => {
        corporateMath()
        elePrice()
    })

    floor_input.addEventListener('input', () => {
        corporateMath()
        elePrice()
    })
}

function hybridMath(){
    let  total_floors = +(floor_input.value) + +(basement_input.value)
    let  column_number = total_floors / 20
    let  total_occupants = +(occupants_input.value) * total_floors
    let  elevator_required = total_occupants / 1000
    let  elevator_column = elevator_required / column_number
    elevators_needed.value = Math.ceil (elevator_column * column_number)
} 

function hybridEleAmount() {
basement_input.addEventListener('input', () => {
    hybridMath()
    elePrice()
})

occupants_input.addEventListener('input', () => {
    hybridMath()
    elePrice()
})

floor_input.addEventListener('input', () => {
    hybridMath()
    elePrice()
})
}

// Total Price===========

function elePrice() {
    let elevatorPrice = (elevators_needed.value) * (Number(String(unit_price.value).replace(/[^0-9.-]+/g,"") ))
    elevator_price.value = dollars.format(elevatorPrice)

    let fees = (Number(String(installation_fee.value).replace(/[^0-9.-]+/g,"") )) / 100
    let finalPrice = (Number(String(elevator_price.value).replace(/[^0-9.-]+/g,"") )) + (Number(String(elevator_price.value).replace(/[^0-9.-]+/g,"") )) * fees
    final_price.value = dollars.format(finalPrice)
}   
})