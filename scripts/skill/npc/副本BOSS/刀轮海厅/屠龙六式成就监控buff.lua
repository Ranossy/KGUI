---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/������ʽ�ɾͼ��buff.lua
-- ����ʱ��:	2017/3/22 18:52:47
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
		if player.GetBuff(11825, 1) then
			local Nbuff = player.GetBuff(11825, 1)
			local Num = Nbuff.nStackNum
			if Num == 3 then
				player.AddBuff(npc.dwID, npc.nLevel, 11826, 1)
				player.DelGroupBuff(11825, 1)
				player.AddBuff(npc.dwID, npc.nLevel, 11826, 1)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com