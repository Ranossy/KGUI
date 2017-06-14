---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/TodayZhanChang_Refresh.lua
-- ����ʱ��:	2017/5/31 20:20:55
-- �����û�:	qingfupei
-- �ű�˵��:
----------------------------------------------------------------------<

local tGlobleToday_BF_ACT_LIST = { -- [ս����ͼID] = ����ID
	[38] = 70, -- ��ũ�
	[48] = 71, -- �Ź����
	[52] = 72, -- 70�ƺ����
	[50] = 75, -- ˿��֮·
	[135] = 121, -- ������ս��
	[186] = 246, -- ������
	--	[120] = 84, -- Ӣ���������
	--	[121] = 86, -- Ӣ����ũ�
	--	[173] = {205},	--�����
	--	[181] = {206}, -- ��Ӱ��
}

local tGlobleToday_ZhanchangList = {	--����ս��ȫ�ֱ�
	[38] = false, -- ��ũ�
	[48] = false, -- �Ź����
	[52] = false, -- 70�ƺ����
	[50] = false, -- ˿��֮·
	[135] = false, -- ������ս��
	[186] = false, -- ������
	--	[120] = 84, -- Ӣ���������
	--	[121] = 86, -- Ӣ����ũ�
	--	[173] = {205},	--�����
	--	[181] = {206}, -- ��Ӱ��
}

--ˢ��ȫ�ֱ�
function On_ZhanChang_RefreshTodayZhanchang()
	for k, v in pairs(tGlobleToday_BF_ACT_LIST) do
		if IsActivityOn(tGlobleToday_BF_ACT_LIST[k])  then
			tGlobleToday_ZhanchangList[k] = true
		else
			tGlobleToday_ZhanchangList[k] = false
		end
	end
end

function GetToday_ZhanchangList()
	return tGlobleToday_ZhanchangList
end

function GetZhanchang_ActList()
	return tGlobleToday_BF_ACT_LIST
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com