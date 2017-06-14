---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/skill����/������������.lua
-- ����ʱ��:	06/07/10 15:59:27
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/PlayerCustomValueName.lh")

tQixueToBuff = 
{
    [ 9]  = {qijing = 1975, xiaoguo = 1985, biaoxian = 2048}, --�¼���+��Ѩ��Ϊ
    [1206]  = {qijing = 1972, xiaoguo = 1982, biaoxian = 2045}, --���+����
    [40]  = {qijing = 1969, xiaoguo = 1979, biaoxian = 2042}, --����+����
    [41]  = {qijing = 1974, xiaoguo = 1984, biaoxian = 2047}, --����+��Ѫ
    [42]  = {qijing = 1968, xiaoguo = 1978, biaoxian = 2041}, --̧��+����
    [43]  = {qijing = 1966, xiaoguo = 1976, biaoxian = 2039}, --����+�˹���������
    [44]  = {qijing = 1973, xiaoguo = 1983, biaoxian = 2046}, --��Ȫ+�⹦����
    [45]  = {qijing = 1970, xiaoguo = 1980, biaoxian = 2043}, --����+�⹦����
    [46]  = {qijing = 1971, xiaoguo = 1981, biaoxian = 2044}, --��Ȫ+�ڹ�����
    [170] = {qijing = 1967, xiaoguo = 1977, biaoxian = 2040}, --����+�ڹ�����
}
 tQixueToXiaoBuff =  
	{
		[9]  = {qijing = 2001, xiaoguo = 2011, biaoxian = 2058}, --�¼���+��Ѩ��Ϊ
		[1206]  = {qijing = 1998, xiaoguo = 2008, biaoxian = 2055}, --���+����
		[40]  = {qijing = 1995, xiaoguo = 2005, biaoxian = 2052}, --����+����
		[41]  = {qijing = 2000, xiaoguo = 2010, biaoxian = 2057}, --����+��Ѫ
		[42]  = {qijing = 1994, xiaoguo = 2004, biaoxian = 2051}, --̧��+����
		[43]  = {qijing = 1992, xiaoguo = 2002, biaoxian = 2049}, --����+�˹���������
		[44]  = {qijing = 1999, xiaoguo = 2009, biaoxian = 2056}, --��Ȫ+�⹦����
		[45]  = {qijing = 1996, xiaoguo = 2006, biaoxian = 2053}, --����+�⹦����
		[46]  = {qijing = 1997, xiaoguo = 2007, biaoxian = 2054}, --��Ȫ+�ڹ�����
		[170] = {qijing = 1993, xiaoguo = 2003, biaoxian = 2050}, --����+�ڹ�����
	}		
		
tLevelToTain = 
{
[0] = 0, 
[1] = 2222,
[2] = 2353,
[3] = 2500,
[4] = 3333,
[5] = 3636,
[6] = 4000,
[7] = 6667,
[8] = 8000,
[9] = 10000,
[10] = 40000,
}


function Apply(dwCharacterID)  --����Ч������ʱ�����
	local player = GetPlayer(dwCharacterID)
	for k, v in pairs(tQixueToBuff) do 
		local buff_jieshou = player.GetBuff(v.qijing, 1)
		if buff_jieshou then  --����Ч�����ý���ʱ�������ж����ĸ���Ѩ��������������
			local nUsedtrain = buff_jieshou.nCustomValue
			local nLastLevel = player.GetSkillLevel(k) or 0
			local nBeforeLevel = player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL)
			local nZongValue = (0.5 * (1 + (1 - 0.1 * nLastLevel)) + (nBeforeLevel - nLastLevel) / 200) * (nUsedtrain - tLevelToTain[nLastLevel])
			if nZongValue <= 0 then
				player.SendSystemMessage(SKILL_STRING_TABLE[31376])
				player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL, 0) --���������Ѩǰ�ȼ�������ҿ����ٴ�ʹ�ô󻹵���
				return 
			end
			local nFanhuanValue =  math.floor(nZongValue / 14)
			player.SendSystemMessage(SKILL_STRING_TABLE[32146] .. nFanhuanValue .. SKILL_STRING_TABLE[31375])
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[32144] .. nFanhuanValue .. SKILL_STRING_TABLE[31375], "yellow")
			player.AddBuff(0, 99, v.xiaoguo, 1)  --��Ӧ��ԭ�򣬸�Ϊֻ��ʾһ��BUFF
			local buff_fanhuan = player.GetBuff(v.xiaoguo, 1)
			buff_fanhuan.nCustomValue = 14 * 100000 + nFanhuanValue
			player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL, 0) --���������Ѩǰ�ȼ�������ҿ����ٴ�ʹ�ô󻹵���
			for i = 1, 14 do 
				player.AddBuff(0, 99, v.biaoxian, 1)  --���ӱ���BUFF
			end
			return 
		end
	end
	
	for k, v in pairs(tQixueToXiaoBuff) do 
		local buff_jieshou = player.GetBuff(v.qijing, 1)
		if buff_jieshou then  --����Ч�����ý���ʱ�������ж����ĸ���Ѩ��������������
			local nUsedtrain = buff_jieshou.nCustomValue
			local nLastLevel = player.GetSkillLevel(k) or 0
			local nBeforeLevel = player.GetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL)
			local nZongValue = (0.5 * (1 + (1 - 0.1 * nLastLevel)) + (nBeforeLevel - nLastLevel) / 200) * (nUsedtrain - tLevelToTain[nLastLevel])
			if nZongValue <= 0 then
				player.SendSystemMessage(SKILL_STRING_TABLE[31376])
				player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL, 0) --���������Ѩǰ�ȼ�������ҿ����ٴ�ʹ�ô󻹵���
				return 
			end
			local nFanhuanValue =  math.floor(nZongValue / 14)
			player.SendSystemMessage(SKILL_STRING_TABLE[32146] .. nFanhuanValue .. SKILL_STRING_TABLE[31375])
			RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", SKILL_STRING_TABLE[32144] .. nFanhuanValue .. SKILL_STRING_TABLE[31375], "yellow")
			player.AddBuff(0, 99, v.xiaoguo, 1)
			local buff_fanhuan = player.GetBuff(v.xiaoguo, 1)
			buff_fanhuan.nCustomValue = 14 * 100000 + nFanhuanValue
			player.SetCustomInteger1(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BEFORE_LEVEL, 0) --���������Ѩǰ�ȼ�������ҿ����ٴ�ʹ��С������
			for i = 1, 14 do 
				player.AddBuff(0, 99, v.biaoxian, 1)  --���ӱ���BUFF
			end
			return 
		end
	end
end

function UnApply(dwCharacterID) 
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com