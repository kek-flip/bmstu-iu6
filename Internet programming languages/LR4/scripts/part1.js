function addGoodToOrder(name, price) {
    if (typeof (addGoodToOrder.counter) == 'undefined') {
        addGoodToOrder.counter = 1;
    }

    var tbody = document.getElementById('order-list');
    console.log(tbody.nodeName);

    var row = document.createElement('tr');

    var counter = document.createElement('td');
    counter.textContent = addGoodToOrder.counter;

    var goodName = document.createElement('td');
    goodName.textContent = name;

    var goodPrice = document.createElement('td');
    goodPrice.textContent = price;
    goodPrice.classList.add('price-col');

    row.appendChild(counter);
    row.appendChild(goodName);
    row.appendChild(goodPrice);

    tbody.appendChild(row);

    addGoodToOrder.counter++;
    document.getElementById('order-good-name').value = '';
    document.getElementById('order-good-price').value = '';
}

function getData() {
    var name = document.getElementById('order-good-name').value;
    var price = document.getElementById('order-good-price').value;
    addGoodToOrder(name, price);
}

function caclPrice() {
    var prices = document.getElementsByClassName('price-col');
    var sum = 0;
    for (price of prices) {
        sum += parseInt(price.textContent);
    }
    document.getElementById('sum-text').textContent = 'Итого: ' + sum;
}

function configPage() {
    var tbody = document.getElementById('goods-list');
    console.log(tbody.nodeName);
    for (var i of tbody.children) {
        i.classList.add('good-row');
        i.addEventListener('click', (event) => {
            var row = event.target.parentElement;
            addGoodToOrder(row.children[1].textContent, row.children[2].textContent);
        })
    }
}

function clearOrder() {
    var tbody = document.getElementById('order-list');
    while(tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
    document.getElementById('sum-text').textContent = 'Итого: ';
}