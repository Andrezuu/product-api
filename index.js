const express = require("express");
const app = express();

app.use(express.json());

app.get("/products", (req, res) => {
    res.json([
        { id: 1, name: "Laptop", price: 1200 },
        { id: 2, name: "Keyboard", price: 100 },
    ]);
});

app.listen(3000, () => console.log("API running on port 3000"));

