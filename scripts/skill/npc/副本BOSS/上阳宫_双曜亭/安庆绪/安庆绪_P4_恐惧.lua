---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_˫��ͤ/������/������_P4_�־�.lua
-- ����ʱ��:	2016/9/11 11:00:30
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local MaxnX = 53433
		local MinnX = 50420
		local MaxnY = 51181
		local MinnY = 48156
		local nRandomX = Random(MinnX, MaxnX)
		local nRandomY = Random(MinnY, MaxnY)
		local nRanD = Random(256)
		player.TurnTo(nRanD)
		local nTargetY = player.nY + math.floor(math.sin(player.nFaceDirection / 128 * math.pi) * 10 * 64)
		local nTargetX = player.nX + math.floor(math.cos(player.nFaceDirection / 128 * math.pi) * 10 * 64)

		player.RunTo(nTargetX, nTargetY)
	end

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com