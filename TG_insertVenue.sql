/*Part4*/
/*This trigger prints an error message if the capacity is less than 40000 before a new venue is added.*/
DROP TRIGGER IF EXISTS insertVenue;
DELIMITER //
CREATE TRIGGER insertVenue
BEFORE INSERT ON Venue
FOR EACH ROW
BEGIN
    DECLARE error_message VARCHAR(100);
    SET error_message = CONCAT('The new venue capacity ', NEW.capacity, ' is lower than 40000.');
    IF NEW.capacity < 40000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = error_message;
    END IF;
END//
DELIMITER ;

