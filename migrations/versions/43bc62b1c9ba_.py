"""empty message

Revision ID: 43bc62b1c9ba
Revises: cf590bc6f60c
Create Date: 2021-03-09 11:50:49.338315

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '43bc62b1c9ba'
down_revision = 'cf590bc6f60c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('Tarif_base',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('maison_appartement', sa.String(), nullable=True),
    sa.Column('Type', sa.String(), nullable=True),
    sa.Column('Prix_EDL', sa.String(), nullable=True),
    sa.Column('Prix_Chiffrage', sa.String(), nullable=True),
    sa.Column('visibility', sa.Boolean(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('Tarif_base')
    # ### end Alembic commands ###