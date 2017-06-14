---------------------------------------------------------------------->
-- �ű�����:	scripts\skill\npc\����BOSS\������_�۷��\��������\buff\Ȫӿ.lua
-- ����ʱ��:	2014/7/14 17:06:43
-- �����û�:	ZHENGYUCHAO
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/������_�۷��/include/��������ͨ������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local targetPlayer = GetPlayer(dwCharacterID)
	if targetPlayer then
		local commonData = DuguData[targetPlayer.GetMapID()]
		if not commonData then
			return
		end
		local scene = targetPlayer.GetScene()
		local hpCostRate = commonData.QYDebuffHpCostPercent / 100 
		
		local damageCost = hpCostRate * targetPlayer.nMaxLife

		local bossNickName = commonData.DGXSNickName
		local scene = targetPlayer.GetScene()
		local myBoss = scene.GetNpcByNickName(bossNickName)

		if myBoss then
			targetPlayer.CustomDamage(myBoss.dwID, commonData.QYFinallySkillID, commonData.QYFinallySkillLevel, 3, damageCost)
			targetPlayer.PlaySfx(43, targetPlayer.nX, targetPlayer.nY, targetPlayer.nZ)
		end
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com