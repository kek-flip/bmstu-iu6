function addGoodToTable() {
    if (typeof (addGoodToTable.counter) == 'undefined') {
        addGoodToTable.counter = 1;
    }

    var tbody = document.getElementsByTagName('tbody')[0];

    var row = document.createElement('tr');

    var counter = document.createElement('td');
    counter.textContent = addGoodToTable.counter;

    var goodName = document.createElement('td');
    goodName.textContent = document.getElementById('good-name').value;

    var goodPrice = document.createElement('td');
    goodPrice.textContent = document.getElementById('good-price').value;

    row.appendChild(counter);
    row.appendChild(goodName);
    row.appendChild(goodPrice);

    tbody.appendChild(row);

    addGoodToTable.counter++;
    document.getElementById('good-name').value = '';
    document.getElementById('good-price').value = '';
}