    select GX_LEASE.LEASEID as "Lease ID",GX_LEASE.COUNTERID,
    GX_LEASE.NAME as "Lease Name",GX_LEASE.LEASE_TYPE as "Lease Type",
    GX_LEASE.CATEGORY as Category,GX_LEASE.ACTIVITY as Activity,
    GX_LEASE.ACQUISITIONDATE as "Acquisition Date",
    GX_LEASE.LEASE_DATE as "Lease Date",GX_LEASE.EFFECTIVEDATE as "Effective Date",
    GX_LEASE.TERM as "Lease Term",GX_LEASE.TERMUNIT as "Lease Term Unit",
    GX_LEASE.EXPIRATIONDATE as "Expiration Date",
    GX_LEASE.OPERATOR as "Lease Operator",
    GX_LEASE.PROSPECTFIELD as "Prospect/Field",
    GX_LEASE.COUNTYPARISH as "County/Parish",
    GX_LEASE.STATEPROVINCE as "State/Province",GX_LEASE.GROSSAREA as "Gross Area",
    GX_LEASE.AREAUNIT as "Area Unit",GX_LEASE.BOOK as Book,
    GX_LEASE.PAGE as Page,GX_LEASE.MICRO as "Microfilm ID#",
    GX_LEASE.REMARK as "Lease Remark",GX_LEASE.TOTALBONUS as "Total Bonus",
    GX_LEASE.RENT_SI_AMT as "Rental/SI Amount",
    GX_LEASE.RENT_PAID_BY as "Rent Paid By",GX_LEASE.DISPOSITION as Disposition,
    GX_LEASE.RENTALDATE as "Rental Date",GX_LEASE.RENTALTERM as "Rental Term",
    GX_LEASE.ROYALTY as Royalty,GX_LEASE.OVERRIDE as Override,
    GX_LEASE.BONUSPERACRE as "Bonus Per Area",
    GX_LEASE.RENTALTERMUNIT as "Rental Term Unit",
    GX_LEASE.USER1 as "User Defined 1",GX_LEASE.USER2 as "User Defined 2"
    from DBA.GX_LEASE 
    ORDER BY "Lease ID";