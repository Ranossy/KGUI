---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_3��_��.lua
-- ����ʱ��:	2015/6/2 17:19:24
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
--function UnApply(dwCharacterID)
	
--end

 function Apply(dwCharacterID)
 	--[[local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end

 	local libai = scene.GetNpcByNickName("qinglianjianxianlibai")
 	if not libai then
 		--return
 	end

 	if libai and libai.bFightState == false then
 		--return
 	end
 	
	if player then
		scene.CreateNpc(43284, player.nX, player.nY, player.nZ, 0, 160)
	end--]]
 end

 function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
 	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
 	
	local libai = scene.GetNpcByNickName("qinglianjianxianlibai")
 	if not libai then
 		return
 	end

 	if libai and libai.bFightState == false then
 		return
 	end
 	
 	if player then
 		if scene.dwMapID == 230 then
 			scene.CreateNpc(47130, player.nX, player.nY, player.nZ, 0, 240)
 		end

 		if scene.dwMapID == 233 then
 			scene.CreateNpc(47666, player.nX, player.nY, player.nZ, 0, 240)
 		end

 		if scene.dwMapID == 235 then
 			scene.CreateNpc(48221, player.nX, player.nY, player.nZ, 0, 240)
 		end

 		if scene.dwMapID == 237 then
 			scene.CreateNpc(48713, player.nX, player.nY, player.nZ, 0, 240)
 		end
	end
 end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com