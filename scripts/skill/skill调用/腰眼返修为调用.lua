---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/skill����/��Ȫ����Ϊ����.lua
-- ����ʱ��:	06/07/10 13:24:29
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function Apply(dwCharacterID)  --����Ч������ʱ����ã�����Ч�����밴��ͬBUFF�ֱ����
	local tQixueToBuff =  
	{
		[9]  = {qijing = 1975, xiaoguo = 1985}, --�¼���+��Ѩ��Ϊ
		[1206]  = {qijing = 1972, xiaoguo = 1982}, --���+����
		[40]  = {qijing = 1969, xiaoguo = 1979}, --����+����
		[41]  = {qijing = 1974, xiaoguo = 1984}, --����+��Ѫ
		[42]  = {qijing = 1968, xiaoguo = 1978}, --̧��+����
		[43]  = {qijing = 1966, xiaoguo = 1976}, --����+�˹���������
		[44]  = {qijing = 1973, xiaoguo = 1983}, --��Ȫ+�⹦����
		[45]  = {qijing = 1970, xiaoguo = 1980}, --����+�⹦����
		[46]  = {qijing = 1971, xiaoguo = 1981}, --��Ȫ+�ڹ�����
		[170] = {qijing = 1967, xiaoguo = 1977}, --����+�ڹ�����
	}
	local player = GetPlayer(dwCharacterID)
	local nQixueID = 41
	local buff = player.GetBuff(tQixueToBuff[nQixueID].xiaoguo, 1)
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
				player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, tQixueToBuff[nQixueID].xiaoguo)
			else
				Log("DebuffID chongtu.Reload Debuff lasttime")
			end	
			player.SendSystemMessage(SKILL_STRING_TABLE[31409] .. nStackNum - 1 .. SKILL_STRING_TABLE[31371])
		elseif nStackNum == 1 then
			player.SendSystemMessage(SKILL_STRING_TABLE[31410])
		end
	end
end

function UnApply(dwCharacterID) 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com