---------------------------------------------------------------------->
-- �ű�����:	scripts/RandomQuest/ͨ�������Ŷ�.lua
-- ����ʱ��:	04/20/11 11:16:45
-- �����û�:	wangxinfeng
-- �ű�˵��:	���ֵ��Ŷӽű�
----------------------------------------------------------------------<


local BF_TIME_LIST = { 
	--"���죬��ũ�˫������"
	[1] = 38, --��ũ�
	--"���죬�Ź����˫����"
	[2] = 48, --�Ź����
	--"���죬70���ƺ����˫������"
	[3] = 52, --70�ƺ����
	--"���죬˿��֮·˫������"
	--[4] = 50, 
}

function Get_BF_Double() 
	local thisTime = 4
	local OneDay = 86400
	local nTime = GetCurrentTime()
	local nNumber = math.floor(nTime / OneDay) % #BF_TIME_LIST + 1
	--print(math.floor(nTime / OneDay), #BF_TIME_LIST, nNumber, dwMapID)
	if BF_TIME_LIST[nNumber] then
		--print("False")
		return true, BF_TIME_LIST[nNumber], thisTime
	else
		--print("False")
		return false, 0, thisTime
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com