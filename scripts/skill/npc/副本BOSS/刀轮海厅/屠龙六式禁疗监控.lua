---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������ʽ���Ƽ��.lua
-- ����ʱ��:	2017/3/13 15:49:47
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local npc = scene.GetNpcByNickName("liuguanjiao")
	if not npc then
		return
	end
	if player then
		if player.GetBuff(11733, 1) then
			local Nbuff = player.GetBuff(11733, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				player.AddBuff(npc.dwID, npc.nLevel, 11791, 1)
				player.DelGroupBuff(11733, 1)
				player.AddBuff(npc.dwID, npc.nLevel, 11733, 1)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com