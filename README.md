# snakemake_lisa
Test repository for running Snakemake on Lisa

## The batch system

**Node allocation**. Quoting from the manual:
> This is why on Lisa, allocation happens on a per-node basis. A small disadvantage of this approach is that even if your application only uses a single core, you will pay for all cores in the node as long as it is allocated to your job - but the system is not intended for small computational tasks that only use a single core anyway.
It is important to use all cores on a node then. 

## Writing a job script

### Wall clock time
The duration can be specified in minutes, or in the MM:SS, or HH:MM:SS format (as in the example), of on the D-HH:MM:SS. 
The maximum walltime for CPU jobs is 120 hours (5 days); An example is `1:30:00`which would mean 1h30min.

## Submitting a job
1. Connect to LISA
2. `sbatch my_lisa_job.sh`
