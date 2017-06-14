Include("scripts\\Include\\GlobalStrings.ls");
Include("scripts\\Include\\LogicConst.lh");

function Apply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		return
	end
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if not scene then
		return
	end

  	local nTargetType, _  = npc.GetTarget()
 	if nTargetType ~= TARGET.PLAYER then
    		return
   	end

	if npc.dwForceID == RELATION_FORCE.HAOQIMENG and scene.dwMapID == 25 then
		npc.SayToCamp(CAMP.GOOD, GLOBAL_STRING_TABLE.WAR_INFIGHT_MESSAGE:format(scene.szDisplayName))
	
	elseif npc.dwForceID == RELATION_FORCE.ERENGU and scene.dwMapID == 27 then
		npc.SayToCamp(CAMP.EVIL, GLOBAL_STRING_TABLE.WAR_INFIGHT_MESSAGE:format(scene.szDisplayName))
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com