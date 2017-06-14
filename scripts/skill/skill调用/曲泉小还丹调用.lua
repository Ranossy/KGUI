---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/skill����/��ȪС��������.lua
-- ����ʱ��:	06/07/10 14:21:55
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function Apply(dwCharacterID)  --����Ч������ʱ����ã�����Ч�����밴��ͬBUFF�ֱ����
	local tQixueToXiaoBuff =  
	{
		[9]  = {qijing = 2001, xiaoguo = 2011}, --�¼���+��Ѩ��Ϊ
		[1206]  = {qijing = 1998, xiaoguo = 2008}, --���+����
		[40]  = {qijing = 1995, xiaoguo = 2005}, --����+����
		[41]  = {qijing = 2000, xiaoguo = 2010}, --����+��Ѫ
		[42]  = {qijing = 1994, xiaoguo = 2004}, --̧��+����
		[43]  = {qijing = 1992, xiaoguo = 2002}, --����+�˹���������
		[44]  = {qijing = 1999, xiaoguo = 2009}, --��Ȫ+�⹦����
		[45]  = {qijing = 1996, xiaoguo = 2006}, --����+�⹦����
		[46]  = {qijing = 1997, xiaoguo = 2007}, --��Ȫ+�ڹ�����
		[170] = {qijing = 1993, xiaoguo = 2003}, --����+�ڹ�����
	}
	local player = GetPlayer(dwCharacterID)
	local nQixueID = 44
	local buff = player.GetBuff(tQixueToXiaoBuff[nQixueID].xiaoguo, 1)
	if buff then
		local nValue = buff.nCustomValue
		local nStackNum = math.floor(nValue / 100000) --��ǰʣ�෵������
		local nFanhuan = nValue - nStackNum * 100000
		player.AddTrainNoLimit(nFanhuan)
		if nStackNum > 1 then 
			player.AddBuff(0, 99, 2029, 1)
			local buff_new = player.GetBuff(2029, 1)
			buff_new.nCustomValue = (nStackNum - 1) * 100000 + nFanhuan
			if player.GetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID) == 0 then --�ɵ���CD��֤������1��������������
				player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, tQixueToXiaoBuff[nQixueID].xiaoguo)
			else
				Log("DebuffID chongtu.Reload Debuff lasttime")
			end	
			player.SendSystemMessage(SKILL_STRING_TABLE[31394] .. nStackNum - 1 .. SKILL_STRING_TABLE[31371])
		elseif nStackNum == 1 then
			player.SendSystemMessage(SKILL_STRING_TABLE[31393])
		end
	end
end

function UnApply(dwCharacterID) 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com