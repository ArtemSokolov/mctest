FROM nextflow/nextflow:21.04.3
RUN mkdir /data
RUN nextflow run labsyspharm/mcmicro/exemplar.nf --name exemplar-001 --path /data
RUN nextflow run labsyspharm/mcmicro/exemplar.nf --name exemplar-002 --path /data
RUN rm -rf /work
