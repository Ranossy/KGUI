function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then 
		return
	end
	local scene = npc.GetScene()
	npc.DoAction(0, 10067)
  if scene.dwMapID ==68 then
     npc.CastSkill(2135, 1)
  elseif scene.dwMapID ==69 then
     npc.CastSkill(2135, 2) 
  elseif scene.dwMapID ==70 then
     npc.CastSkill(2135, 3) 
  elseif scene.dwMapID ==72 then
     npc.CastSkill(2135, 4) 
  end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com