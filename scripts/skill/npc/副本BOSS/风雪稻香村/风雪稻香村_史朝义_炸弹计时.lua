---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_ʷ����_ը����ʱ.lua
-- ����ʱ��:	2014/3/20 15:42:56
-- �����û�:	wangpengfei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSrcID)
	local npcZ = GetNpc(dwCharacterID)
	if not npcZ then
		return
	end
	npcZ.CastSkill(8991, 1)
	npcZ.PlaySfx(689, npcZ.nX, npcZ.nY, npcZ.nZ)
	local nID = npcZ.GetCustomInteger4(1)
	local playertarget = GetPlayer(nID)
	if playertarget then
		if playertarget.GetBuff(7438, 1) then
			playertarget.DelBuff(7438, 1)
		end
	end
	npcZ.SetDisappearFrames(1, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com