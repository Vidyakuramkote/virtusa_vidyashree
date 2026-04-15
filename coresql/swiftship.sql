-- TABL
CREATE TABLE Partners (
    PartnerID INT PRIMARY KEY,
    PartnerName VARCHAR(100)
);

CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    PartnerID INT,
    OrderDate DATE,
    PromisedDate DATE,
    ActualDeliveryDate DATE,
    DestinationCity VARCHAR(100),
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID)
);

CREATE TABLE DeliveryLogs (
    LogID INT PRIMARY KEY,
    ShipmentID INT,
    Status VARCHAR(50),
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
);

-- DATA
INSERT INTO Partners VALUES
(1, 'DHL'), (2, 'FedEx'), (3, 'BlueDart');

INSERT INTO Shipments VALUES
(101, 1, '2026-03-01', '2026-03-05', '2026-03-06', 'Bangalore'),
(102, 2, '2026-03-02', '2026-03-06', '2026-03-05', 'Mumbai'),
(103, 1, '2026-03-03', '2026-03-07', '2026-03-08', 'Delhi'),
(104, 3, '2026-03-10', '2026-03-15', '2026-03-14', 'Bangalore'),
(105, 2, '2026-03-12', '2026-03-18', '2026-03-20', 'Chennai');

INSERT INTO DeliveryLogs VALUES
(1, 101, 'Delivered'),
(2, 102, 'Delivered'),
(3, 103, 'Returned'),
(4, 104, 'Delivered'),
(5, 105, 'Delivered');

-- FINAL SCORECARD
SELECT 
    p.PartnerName,
    COUNT(s.ShipmentID) AS TotalShipments,
    SUM(CASE 
        WHEN s.ActualDeliveryDate > s.PromisedDate THEN 1 
        ELSE 0 
    END) AS DelayedShipments,
    SUM(CASE 
        WHEN d.Status = 'Delivered' THEN 1 
        ELSE 0 
    END) AS SuccessfulDeliveries,
    ROUND(
        (SUM(CASE WHEN d.Status = 'Delivered' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(s.ShipmentID), 2
    ) AS SuccessRate
FROM Partners p
JOIN Shipments s ON p.PartnerID = s.PartnerID
JOIN DeliveryLogs d ON s.ShipmentID = d.ShipmentID
GROUP BY p.PartnerName
ORDER BY DelayedShipments ASC;
