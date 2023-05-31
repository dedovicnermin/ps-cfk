1. timestamp extractor = Wallclock 
2. record field for timestamp extractor (not applicable in this dir config) == `timestamp`

Using HourlyPartitioner:

1. dir structure: `<topics.dir>/topic/year=X/month=Y/day=Z/hour=zz/<topic>+<partition>+<offset>.ext`

ex: `dev/dailypartitioner/avro/avro.shoe.orders/year=2023/month=05/day=21/avro.shoe.orders+0+00000000000010.avro`

