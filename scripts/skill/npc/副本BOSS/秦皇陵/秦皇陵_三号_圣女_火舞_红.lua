---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_����_ʥŮ_����_��.lua
-- ����ʱ��:	2014/3/20 11:36:58
-- �����û�:	wangwei-pc2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	
	if not player then
		return
	end
	local scene = player.GetScene()
	local buffLV = 0
	if scene.dwMapID == 182 then
		buffLV = 1
	else
		buffLV = 2
	end
	local buff = player.GetBuff(7640, buffLV)
	if buff then
		player.DelGroupBuff(7640, buffLV)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com