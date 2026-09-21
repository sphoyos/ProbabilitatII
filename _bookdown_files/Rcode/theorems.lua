function Meta(meta)
  if not meta["theorem-title"] then
    meta["theorem-title"] = pandoc.MetaString("Teorema")
  end
  if not meta["lemma-title"] then
    meta["lemma-title"] = pandoc.MetaString("Lema")
  end
  if not meta["corollary-title"] then
    meta["corollary-title"] = pandoc.MetaString("Corol·lari")
  end
  if not meta["definition-title"] then
    meta["definition-title"] = pandoc.MetaString("Definició")
  end
  if not meta["example-title"] then
    meta["example-title"] = pandoc.MetaString("Exemple")
  end
  if not meta["proof-title"] then
    meta["proof-title"] = pandoc.MetaString("Demostració")
  end
  return meta
end