import uuid
from dataclasses import dataclass, field

from sqlalchemy import Column, ForeignKey, Integer, String, create_engine
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import declarative_base, mapper, relationship, sessionmaker

DATABASE_URL = "postgresql+psycopg2://postgres:postgres@localhost/expedition33"

engine = create_engine(DATABASE_URL, echo=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def gen_id() -> str:
    return str(uuid.uuid4())

class PersonModel(Base):
    __tablename__ = "persons"

    id = Column(UUID, primary_key=True, default=uuid.uuid4)
    name = Column(String)
    age = Column(Integer)


class AddressModel(Base):
    __tablename__ = "addresses"

    id = Column(UUID, primary_key=True, default=uuid.uuid4)
    person_id = Column(UUID, ForeignKey("persons.id"), nullable=False)
    address = Column(String)


@dataclass(kw_only=True, unsafe_hash=True)
class Person:
    name: str
    age: int
    id: str = field(default_factory=gen_id)


@dataclass(kw_only=True, unsafe_hash=True)
class Address:
    address: str
    id: str = field(default_factory=gen_id)
    person: Person | None = None
    person_id: str | None = None


def start_mappers():
    mapper(Person, PersonModel.__table__)
    mapper(Address, AddressModel.__table__, properties={"person": relationship(Person)})
