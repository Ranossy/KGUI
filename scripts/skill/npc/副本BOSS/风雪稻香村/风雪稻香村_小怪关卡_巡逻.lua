---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ѩ�����/��ѩ�����_С�ֹؿ�_Ѳ��.lua
-- ����ʱ��:	2014/4/20 21:36:39
-- �����û�:	wangpengfei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local npcthis = GetNpc(dwCharacterID)
	if not npcthis then
		return
	end
	npcthis.SetDisappearFrames(1 * GLOBAL.GAME_FPS, false)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com