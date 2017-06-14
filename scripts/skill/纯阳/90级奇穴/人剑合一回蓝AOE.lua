---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�˽���һ����AOE.lua
-- ����ʱ��:	2013/6/5 0:32:49
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  Default.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 98, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 1
	{ nDamageBase = 125, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 2
	{ nDamageBase = 153, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 3
	{ nDamageBase = 180, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 4
	{ nDamageBase = 207, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 5
	{ nDamageBase = 218, nDamageRand = 0, nCostMana = 0, nAccumulate = 1}, --level 6
};

tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},

}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	if dwSkillLevel == 1 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 2 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE2.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 3 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE3.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 4 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE4.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 5 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE5.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 6 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE6.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 7 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE7.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 8 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE8.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 9 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE9.lua", -- ��Э��
			0
		);
	end
	if dwSkillLevel == 10 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/����/90����Ѩ/�˽���һ����AOE10.lua", -- ��Э��
			0
		);
	end
	
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 5651, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.TargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.SelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.SelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end
	--print(444)
	--if player.GetSkillLevel(5806) == 1 then
	if player.IsInMyGroupOrTeam(dwCharacterID) and not target.GetBuff(7913, 1) and target.dwShapeShiftID == 0 then
		--print(5555)
		target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.005 * 2
		target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.025 * 2
	end
	--end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com