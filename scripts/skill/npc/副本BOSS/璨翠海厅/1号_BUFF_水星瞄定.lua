---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/貴亣��/1��_BUFF_ˮ���鶨.lua
-- ����ʱ��:	2015/6/4 0:35:21
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
			print(99999)
			scene.CreateNpc(43195, player.nX, player.nY, player.nZ, 0, 16 * 3);
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com