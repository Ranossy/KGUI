---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_��������_ɳ��buff.lua
-- ����ʱ��:	2014/10/29 14:21:14
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 195 then
		player.CastSkill(13281, 1)
	else
		player.CastSkill(13281, 2)
	end
	player.PlaySfx(497, player.nX, player.nY, player.nZ + 64)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com