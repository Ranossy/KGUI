---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/������/������_��ֹ����.lua
-- ����ʱ��:	2017/3/7 21:33:38
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Craft/Include/strings.ls")
Include("scripts/Include/Player.lh")
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local tReviveSetting = player.GetReviveCtrl()
		tReviveSetting.nReviveFrame = tReviveSetting.nReviveFrame + 50 * 60 * GLOBAL.GAME_FPS --�趨ʱ��50����
		tReviveSetting.nNextCheckReviveFrame = tReviveSetting.nReviveFrame
		player.SetReviveCtrl(tReviveSetting)
		CheckPlayerReviveCommon(player)
	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com