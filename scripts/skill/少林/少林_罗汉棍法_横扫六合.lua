---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�޺�����_��ɨ����.lua
-- ����ʱ��:	2013/4/24 20:56:40
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�޺�����_��ɨ����
-- ������    :  �º���
-- ����ʱ��  :  2008-07-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �޺�����
-- ��������  :  ��ɨ����
-- ����Ч��  :  ����Χ5��Ŀ������˺�������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 13, 	nDamageRand = 0}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 16, 	nDamageRand = 0}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 18, 	nDamageRand = 0}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 20, 	nDamageRand = 0}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, 	nDamageRand = 0}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 24, 	nDamageRand = 0}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, 	nDamageRand = 0}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29, 	nDamageRand = 0}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 0}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 33, 	nDamageRand = 0}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35, 	nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, 	nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, 	nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, 	nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 0}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 0}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 0}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 53, 	nDamageRand = 0}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, 	nDamageRand = 0}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 57, 	nDamageRand = 0}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, 	nDamageRand = 0}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 62, 	nDamageRand = 0}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, 	nDamageRand = 0}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66, 	nDamageRand = 0}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68, 	nDamageRand = 0}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, 	nDamageRand = 0}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, 	nDamageRand = 0}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, 	nDamageRand = 0}, -- Level 29
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_�޺�����_��ɨ����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);


	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 743, dwSkillLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 69);
	skill.SetCheckCoolDown(1, 444);
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 433*0.2*0.7;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 433 * 0.4*0.7;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 433 * 0.6*0.7;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 433 * 0.8*0.7;
	else
		skill.nCostManaBasePercent = 433*0.7;
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 5;					-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 0;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(5808)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local tlevel1 = tplayer.GetSkillLevel(235)
	local tlevel2 = tplayer.GetSkillLevel(5910)
	local nSkill = tplayer.GetKungfuMount()

	--Ŀ��Խ���˺�Խ��
	tplayer.CastSkill(15875, tlevel1)
	
	if tplayer.GetSkillLevel(14745) == 1 then
		tplayer.CastSkill(3806, tlevel1)	--AOE�����ж���ӱ��buff B_3868
		local nbuff_mark = tplayer.GetBuff(3868, 1)
		if nbuff_mark then
			local nCount = nbuff_mark.nStackNum
			if nCount ~= 0 then
				for i = 1, nCount do
					--tplayer.CastSkill(14746, 1)	--����һ��Ŀ����1���Ϣʱ��
					tplayer.AddBuff(tplayer.dwID, tplayer.nLevel, 9795, nCount)	
				end
			end
		end
		tplayer.DelGroupBuff(3868, 1)
	end

	--�ؼ�Ⱥ��
	if tplayer.IsSkillRecipeActive(262, 1) then
		tplayer.CastSkill(16887, 1)
	end

	--���е�һĿ���˺��ͳ�����
	if tlevel2 == 1 then
		tplayer.CastSkill(3806, tlevel1)	--AOE�����ж���ӱ��buff B_3868
		--��S_9280dot��Ϊ�ɵ���
		if tplayer.GetSkillLevel(9280) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10003 then
			tplayer.CastSkill(3810, tlevel1+29)
			tplayer.CastSkill(3808, tlevel1+29)
			tplayer.CastSkill(3812, tlevel1+29)
		else
			tplayer.CastSkill(3810, tlevel1)	--�׾���,ֻ����һ��Ŀ��
			tplayer.CastSkill(3808, tlevel1)	--˫�ķ�����������Ŀ��
			tplayer.CastSkill(3812, tlevel1)	--ϴ���µ�Ŀ��
		end

		for i = 1, 5 do
			tplayer.DelBuff(3868, 1)
		end
	else
		tplayer.CastSkill(3806, tlevel1)
		if tplayer.GetSkillLevel(9280) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10003 then
			tplayer.CastSkill(3830, tlevel1+29)
		else
			tplayer.CastSkill(3830, tlevel1)	
		end
		
		for i = 1, 5 do
			tplayer.DelBuff(3868, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com