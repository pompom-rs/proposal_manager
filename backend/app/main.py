from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Proposal Manager API",
    description="API pro aplikaci Proposal Manager",
    version="0.1.0",
)

# Konfigurace CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # V produkci by mělo být omezeno na konkrétní domény
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Vítejte v Proposal Manager API"}

@app.get("/health")
async def health_check():
    return {"status": "ok"}
