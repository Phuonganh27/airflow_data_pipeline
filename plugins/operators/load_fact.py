from airflow.hooks.postgres_hook import PostgresHook
from airflow.models import BaseOperator
from airflow.utils.decorators import apply_defaults
from helpers.sql_queries import SqlQueries
# from udacity.common.final_project_sql_statements import SqlQueries

class LoadFactOperator(BaseOperator):
    ui_color = '#F98866'
    load_fact_sql = "INSERT INTO {} {}"
    @apply_defaults
    def __init__(self,
                 table="songplays",
                 redshift_conn_id="",
                 mode="",
                 *args, **kwargs):

        super(LoadFactOperator, self).__init__(*args, **kwargs)
       
        self.redshift_conn_id = redshift_conn_id
        self.table = table
        self.mode = mode 

    def execute(self, context):
        self.log.info('Initializing redshift connection')
        redshift = PostgresHook(postgres_conn_id=self.redshift_conn_id)

        if self.mode == 'truncate-append':
            self.log.info("Clearing data from destination Redshift table")
            redshift.run("TRUNCATE TABLE {}".format(self.table))

        self.log.info("Inserting data to destination Redshift table")
        formatted_load_fact_sql = LoadFactOperator.load_fact_sql.format(self.table, SqlQueries.songplay_table_insert)
        redshift.run(formatted_load_fact_sql)

