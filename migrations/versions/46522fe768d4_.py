"""empty message

Revision ID: 46522fe768d4
Revises: bd5d03176611
Create Date: 2021-02-20 15:00:24.133749

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '46522fe768d4'
down_revision = 'bd5d03176611'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_foreign_key(None, 'Agenda', 'Client', ['clien_t'], ['id'])
    op.drop_constraint('Client_email_key', 'Client', type_='unique')
    op.create_foreign_key(None, 'Facturation', 'Client', ['Proprietaire'], ['id'])
    op.create_foreign_key(None, 'Facturation', 'Client', ['Locataire'], ['id'])
    op.create_foreign_key(None, 'Facturation', 'Client', ['Destinataire'], ['id'])
    op.create_foreign_key(None, 'Mission', 'Client', ['Reference_LOCATAIRE'], ['id'], onupdate='CASCADE', ondelete='CASCADE')
    op.create_foreign_key(None, 'Mission', 'Client', ['Reference_BAILLEUR'], ['id'], onupdate='CASCADE', ondelete='CASCADE')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'Mission', type_='foreignkey')
    op.drop_constraint(None, 'Mission', type_='foreignkey')
    op.drop_constraint(None, 'Facturation', type_='foreignkey')
    op.drop_constraint(None, 'Facturation', type_='foreignkey')
    op.drop_constraint(None, 'Facturation', type_='foreignkey')
    op.create_unique_constraint('Client_email_key', 'Client', ['email'])
    op.drop_constraint(None, 'Agenda', type_='foreignkey')
    # ### end Alembic commands ###
