


DECLARE @yesterday VARCHAR(8)= cast(convert(varchar(8),dateadd(d,-1,cast(getdate() as date)),112) as int);

INSERT INTO tblassa_salesimport
(RecordType,
 BusinessUnitID,
 TransDate,
 OrderNo,
 LineNbr,
 LineSeq,
 TransType,
 ProductKey,
 BookDate,
 CustomerNo,
 TerritoryCode,
 MarketSegment,
 AAMarketChannel,
 SalesOrgCode,
 PODate,
 ListUnitPrice,
 StandardUnitPrice,
 NetUnitPrice,
 TransAmount,
 PartNo,
 PkgPartNo,
 NoOfPackages,
 QuantityPerPkg,
 TransUnits,
 TransPieces,
 ProductDesc,
 PlantCode,
 ReadySetNo,
 InvoiceNo,
 RequestDate,
 ScheduleDate,
 InvoiceDate,
 FreightAmount,
 BUDefined025,
 BUDefined026,
 BUDefined076,
 Spare019,
 budefined001,
 ActualShipDate,
 budefined017
)
       SELECT RecordType,
              BusinessUnitID,
              TransDate,
              OrderNo,
              LineNbr,
              LineSeq,
              TransType,
              ProductKey,
              BookDate,
              CustomerNo,
              TerritoryCode,
              MarketSegment,
              AAMarketChannel,
              SalesOrgCode,
              PODate,
              ListUnitPrice,
              StandardUnitPrice,
              NetUnitPrice,
              TransAmount,
              PartNo,
              PkgPartNo,
              NoOfPackages,
              QuantityPerPkg,
              TransUnits,
              TransPieces,
              ProductDesc,
              PlantCode,
              ReadySetNo,
              InvoiceNo,
              RequestDate,
              ScheduleDate,
              InvoiceDate,
              FreightAmount,
              BUDefined025,
              BUDefined026,
              BUDefined076,
              Spare019,
              budefined001,
              ActualShipDate,
		    budefined017
       FROM vsalesimport
       where transDATE  = @yesterday;
INSERT INTO tblassa_bookingsimport
([RecordType],
 [BusinessUnitID],
 [TransDate],
 [OrderNo],
 [LineNbr],
 [LineSeq],
 [TransType],
 [ProductKey],
 [BookDate],
 [CustomerNo],
 [TerritoryCode],
 [MarketSegment],
 [AAMarketChannel],
 [SalesOrgCode],
 [PODate],
 [ListUnitPrice],
 [StandardUnitPrice],
 [NetUnitPrice],
 [TransAmount],
 [PartNo],
 [PkgPartNo],
 [NoOfPackages],
 [QuantityPerPkg],
 [TransUnits],
 [TransPieces],
 [ProductDesc],
 [PlantCode],
 [ReadySetNo],
 [RequestDate],
 [ScheduleDate],
 [BUDefined025],
 [BUDefined026],
 [BUDefined076],
 [Spare019],
 [BUDefined001],
 budefined017
)
       SELECT [RecordType],
              [BusinessUnitID],
              [TransDate],
              [OrderNo],
              [LineNbr],
              [LineSeq],
              [TransType],
              [ProductKey],
              [BookDate],
              [CustomerNo],
              [TerritoryCode],
              [MarketSegment],
              [AAMarketChannel],
              [SalesOrgCode],
              [PODate],
              [ListUnitPrice],
              [StandardUnitPrice],
              [NetUnitPrice],
              [TransAmount],
              [PartNo],
              [PkgPartNo],
              [NoOfPackages],
              [QuantityPerPkg],
              [TransUnits],
              [TransPieces],
              [ProductDesc],
              [PlantCode],
              [ReadySetNo],
              [RequestDate],
              [ScheduleDate],
              [BUDefined025],
              [BUDefined026],
              [BUDefined076],
              [Spare019],
              [BUDefined001],
		    budefined017
       FROM vbookingsimport
       where transDATE  = @yesterday;
INSERT INTO tblassa_hashimport
(businessunitid,
 transdate,
 datatype,
 recordcount,
 totalunits,
 totaldollars,
 totalpieces
)
       SELECT *
       FROM
(





    SELECT 425 AS BusinessUnitId,
           x.TransDate,
           'Sales' AS DataType,
           COUNT(*) AS RecordCount,
           SUM(x.TransUnits) AS TotalUnits,
           SUM(x.TransAmount) AS TotalDollars,  --%%%%%%%%%%%%%%%    SALES
           SUM(x.TransPieces) AS TotalPieces
    FROM vsalesimport AS x
    WHERE X.transdate  = @yesterday
          AND x.transtype NOT IN('F', 'N')
    GROUP BY X.TransDate



    UNION



    SELECT 425 AS BusinessUnitId,
           y.TransDate,
           'SalesNC' AS DataType,
           COUNT(*) AS RecordCount,
           SUM(Y.TransUnits) AS TotalUnits,
           SUM(Y.TransAmount) AS TotalDollars,  --%%%%%%%%%%%%%%%     SALES NC
           SUM(Y.TransPieces) AS TotalPieces
    FROM vsalesimport AS y
    WHERE Y.transdate  = @yesterday
          AND Y.TransType = 'N'
    GROUP BY Y.TransDate




    UNION



    SELECT 425 AS BusinessUnitId,
           TransDate,
           'Freight' AS DataType,
           COUNT(*) AS RecordCount,
           SUM(z.TransUnits) AS TotalUnits,    --%%%%%%%%%%%%%%%%%%%    FREIGHT
           SUM(z.TransAmount) AS TotalDollars,
           SUM(z.TransPieces) AS TotalPieces
    FROM vsalesimport AS z
    WHERE Z.transdate  = @yesterday
          AND z.TransType = 'F'
    GROUP BY Z.TransDate




    UNION


	
    SELECT 425 AS BusinessUnitId,
           TransDate,
           'Bookings' AS DataType,
           COUNT(*) AS RecordCount,
           SUM(a.TransUnits) AS TotalUnits,
           SUM(a.TransAmount) AS TotalDollars,    --%%%%%%%%%%%%%%%%   BOOKINGS  
           SUM(a.TransPieces) AS TotalPieces
    FROM vbookingsimport AS a
    WHERE A.transdate  = @yesterday
          AND a.TransType <> 'N'
    GROUP BY a.TransDate



    UNION 



    SELECT 425 AS BusinessUnitId,
           TransDate,
           'BookingsNC' AS DataType,
           COUNT(*) AS RecordCount,
           SUM(b.TransUnits) AS TotalUnits,
           SUM(b.TransAmount) AS TotalDollars,     --%%%%%%%%%%%%%%%%%%   BOOKINGS NC
           SUM(b.TransPieces) AS TotalPieces
    FROM vBookingsimport AS b
    WHERE B.transdate  = @yesterday
          AND b.TransType = 'N'
    GROUP BY b.TransDate
) m;







insert into tblassa_productimport (productkey
,businessunitid
,partno
, productdesc

,configuredflag
,activeflag
,aacategory01
,electromechflag) 

select distinct

productkey, 
businessunitid,
partno,
ProductDesc,
'N' as configuredflag,
'Y' as activeflag,
'Ameristar' as AACategory01,
'N' as ElectroMechFlag
from vsalesimport

where transdate  = @yesterday
 and PartNo is not null
 and PartNo <> ''