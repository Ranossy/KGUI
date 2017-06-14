-- �ɾͱ�, �г�����ɳɾ���Ҫ�ĵ���, Key �ǵ�������ID, �� dwIndex
tItemAcquireAchievementList = {
    [4503] = {nType = ITEM_TABLE_TYPE.OTHER, nAmount = 1, dwAchievementID = 580},
}

-- ��װ�ɾͱ�װ����һ����װ��ɸóɾ�,������������Ϳ�����
tEquipAchievementIDList = 
{
	[139] =	--���ֵĵ�һ������װ���ɾ�ID 139��
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 107, --�������
			[EQUIPMENT_INVENTORY.HELM] = 266, --�������
			[EQUIPMENT_INVENTORY.CHEST] = 425, --�������
			[EQUIPMENT_INVENTORY.PANTS] = 616, --�������
			[EQUIPMENT_INVENTORY.BOOTS] = 808, --���ɮ��
			[EQUIPMENT_INVENTORY.WAIST] = 984, --�������
		},
		
	[133] = --��ߵ�һ������װ���ɾ�ID 133��
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 111, --���令��
			[EQUIPMENT_INVENTORY.HELM] = 270, --������
			[EQUIPMENT_INVENTORY.CHEST] = 429, --������
			[EQUIPMENT_INVENTORY.PANTS] = 620, --�����
			[EQUIPMENT_INVENTORY.BOOTS] = 812, --����ѥ
			[EQUIPMENT_INVENTORY.WAIST] = 988, --���令��		
		},

	[137] = --�����һ������װ���ɾ�ID 137��
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 112, --���޻���
			[EQUIPMENT_INVENTORY.HELM] = 271, --������
			[EQUIPMENT_INVENTORY.CHEST] = 430, --������
			[EQUIPMENT_INVENTORY.PANTS] = 621, --����ȹ
			[EQUIPMENT_INVENTORY.BOOTS] = 813, --������Ь
			[EQUIPMENT_INVENTORY.WAIST] = 989, --����˿��
		},
		
	[135] = --�򻨵�һ������װ���ɾ�ID 135��
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 108, --���Ļ���
			[EQUIPMENT_INVENTORY.HELM] = 267, --����ñ
			[EQUIPMENT_INVENTORY.CHEST] = 426, --������
			[EQUIPMENT_INVENTORY.PANTS] = 617, --���ĳ���
			[EQUIPMENT_INVENTORY.BOOTS] = 809, --����Ь
			[EQUIPMENT_INVENTORY.WAIST] = 985, --��������
		},
		
	[646] = --������һ������װ���ɾ�ID 141��Ŀ��ID 646
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 109, --�����ʵ�����
			[EQUIPMENT_INVENTORY.HELM] = 268,--�����ʵ���
			[EQUIPMENT_INVENTORY.CHEST] = 427,--�����ʵ���
			[EQUIPMENT_INVENTORY.PANTS] = 618,--�����ʵ���
			[EQUIPMENT_INVENTORY.BOOTS] = 810,--�����ʵ�Ь
			[EQUIPMENT_INVENTORY.WAIST] = 986,--�����ʵ����
		},

	[699] = --������һ������װ���ɾ�ID 141��Ŀ��ID 699
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 110,--�������滤��
			[EQUIPMENT_INVENTORY.HELM] = 269,--���������
			[EQUIPMENT_INVENTORY.CHEST] = 428,--����������
			[EQUIPMENT_INVENTORY.PANTS] = 619,--����������
			[EQUIPMENT_INVENTORY.BOOTS] = 811,--��������Ь
			[EQUIPMENT_INVENTORY.WAIST] = 987,--�����������
		},
		
}

tEquipAchievementItemList = {}
local AddEquipAchievement = function(dwAchievementID, t)
	t[EQUIPMENT_INVENTORY.TOTAL] = dwAchievementID
	for k, v in pairs(t) do
		tEquipAchievementItemList[v] = t
	end
end

for k, v in pairs(tEquipAchievementIDList) do
	AddEquipAchievement(k, v)
end

tEquipQualityList = 
{
	[EQUIPMENT_INVENTORY.MELEE_WEAPON] = true,
	[EQUIPMENT_INVENTORY.CHEST] = true,
	[EQUIPMENT_INVENTORY.HELM] = true,
	[EQUIPMENT_INVENTORY.PANTS] = true,
	[EQUIPMENT_INVENTORY.BOOTS] = true,
	[EQUIPMENT_INVENTORY.BANGLE] = true,
	[EQUIPMENT_INVENTORY.WAIST] = true,
}

function IsAllEquipQuality(player, nQuality)
	for k, v in pairs(tEquipQualityList) do
		local item = player.GetItem(INVENTORY_INDEX.EQUIP, k)
		if not item or item.nQuality ~= nQuality then
			return false
		end
	end
	return true
end

function IsAllEquipLevel(player, nLevel)
	for k, v in pairs(tEquipQualityList) do
		local item = player.GetItem(INVENTORY_INDEX.EQUIP, k)
		if not item or item.nLevel < nLevel then
			return false
		end
	end
	return true
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com