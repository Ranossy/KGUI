---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/skill����/��Ȫ����Ϊ����.lua
-- ����ʱ��:	06/07/10 13:24:29
-- �����û�:	zhouhengda2
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/PlayerCustomValueName.lh")

tQixueToBuffAll = 
{
    [ 1]  = {qijing = 1975, xiaoguo = 1985, biaoxian = 2048}, --�¼���+��Ѩ��Ϊ
    [2]  = {qijing = 1972, xiaoguo = 1982, biaoxian = 2045}, --���+����
    [3]  = {qijing = 1969, xiaoguo = 1979, biaoxian = 2042}, --����+����
    [4]  = {qijing = 1974, xiaoguo = 1984, biaoxian = 2047}, --����+��Ѫ
    [5]  = {qijing = 1968, xiaoguo = 1978, biaoxian = 2041}, --̧��+����
    [6]  = {qijing = 1966, xiaoguo = 1976, biaoxian = 2039}, --����+�˹���������
    [7]  = {qijing = 1973, xiaoguo = 1983, biaoxian = 2046}, --��Ȫ+�⹦����
    [8]  = {qijing = 1970, xiaoguo = 1980, biaoxian = 2043}, --����+�⹦����
    [9]  = {qijing = 1971, xiaoguo = 1981, biaoxian = 2044}, --��Ȫ+�ڹ�����
    [10] = {qijing = 1967, xiaoguo = 1977, biaoxian = 2040}, --����+�ڹ�����
	[11]  = {qijing = 2001, xiaoguo = 2011, biaoxian = 2058}, --�¼���+��Ѩ��Ϊ
	[12]  = {qijing = 1998, xiaoguo = 2008, biaoxian = 2055}, --���+����
	[13]  = {qijing = 1995, xiaoguo = 2005, biaoxian = 2052}, --����+����
	[14]  = {qijing = 2000, xiaoguo = 2010, biaoxian = 2057}, --����+��Ѫ
	[15]  = {qijing = 1994, xiaoguo = 2004, biaoxian = 2051}, --̧��+����
	[16]  = {qijing = 1992, xiaoguo = 2002, biaoxian = 2049}, --����+�˹���������
	[17]  = {qijing = 1999, xiaoguo = 2009, biaoxian = 2056}, --��Ȫ+�⹦����
	[18]  = {qijing = 1996, xiaoguo = 2006, biaoxian = 2053}, --����+�⹦����
	[19]  = {qijing = 1997, xiaoguo = 2007, biaoxian = 2054}, --��Ȫ+�ڹ�����
	[20] = {qijing = 1993, xiaoguo = 2003, biaoxian = 2050}, --����+�ڹ�����
}



function Apply(dwCharacterID)  --����Ч������ʱ����ã�����Ч�����밴��ͬBUFF�ֱ����
	local player = GetPlayer(dwCharacterID)
	local dwBuffID = player.GetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID)
	local buff = player.GetBuff(2029, 1)
	local dwBiaoxianID = 0
	if buff then
		local nValue = buff.nCustomValue
		local nStackNum = math.floor(nValue / 100000) --��ǰʣ�෵������
		player.AddBuff(0, 99, dwBuffID, 1)
		local buff_new = player.GetBuff(dwBuffID, 1)
		if buff_new then
			buff_new.nCustomValue = nValue
		end
		player.SetCustomUnsigned4(PLAYER_CUSTOM_VALUE.XIUWEIHUHANG_BUFFID, 0)
		for k, v in pairs(tQixueToBuffAll) do 
			if v.xiaoguo == dwBuffID then
				dwBiaoxianID = v.biaoxian
			end
		end
		if dwBiaoxianID ~= 0 and nStackNum >= 1 then
			for i = 1, nStackNum do 
				player.AddBuff(0, 99, dwBiaoxianID, 1)
			end
		end
	end
end

function UnApply(dwCharacterID) 
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com