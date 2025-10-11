// data from 2025-09-13 - 2025-09-10

const data = [
    [1, 6659],
    [2, 6421],
    [3, 6625],
    [4, 1732],
    [5, 1696],
    [6, 6864],
    [7, 6485],
    [8, 6562],
    [9, 6926],
    [10, 6610],
    [13, 1814],
    [14, 1704],
    [15, 6124],
    [16, 5561],
    [17, 5346],
    [18, 6177],
    [19, 6388],
    [20, 1804],
    [21, 1792],
    [22, 6426],
    [23, 6095],
    [24, 6173],
    [25, 7633],
    [26, 5813],
    [27, 1918],
    [28, 1480],
    [29, 6240],
    [30, 6900],
]

const sum = {}
const count = {}

for (const value of data) {
    const month = value[0] > 12 ? "09" : "10"
    const date = new Date(`2025-${month}-${value[0]}`);

    if (!sum[date.getDay()]) sum[date.getDay()] = 0;
    if (!count[date.getDay()]) count[date.getDay()] = 0;
    sum[date.getDay()] += value[1]
    count[date.getDay()] += 1
}

const result = {}

for (const day of [0, 1, 2, 3, 4, 5, 6]) {
    result[day] = sum[day] / count[day]
}

console.log(result)

// result
// '0': 1668,
// '1': 6413.5,
// '2': 6260.25,
// '3': 6185,
// '4': 6789.25,
// '5': 6359,
// '6': 1817