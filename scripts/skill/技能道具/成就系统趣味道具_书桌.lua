---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua
-- ����ʱ��:	01/25/10 16:06:06
-- �����û�:	liuhengzhi1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnOpen(doodad, player)
	-- ����Ҫ��һ������ֵ��ȷ���Ƿ�������Ҵ򿪴�DOODAD
	
	local nTargetType, dwTargetID = player.GetTarget()
	if nTargetType ~= TARGET.DOODAD then
		return false
	end
	
	local doodadTarget = GetDoodad(dwTargetID)
	if not doodadTarget then
		return false
	end
	
	local nBuffLeftCount = 31 - (GetCurrentTime() - doodadTarget.GetCustomUnsigned4(0))
	
	if nBuffLeftCount > 0 then
		player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
		player.DoAction(player.dwID, 20961)
		player.AddBuff(0, 99, 1527, 1, nBuffLeftCount)  --������ڼ�ʱ��������BUFF
	end
	
	return false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com