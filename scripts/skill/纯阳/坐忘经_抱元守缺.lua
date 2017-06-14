------------------------------------------------
-- �ļ���    :  ������_��Ԫ��ȱ.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ��Ԫ��ȱ
-- ����Ч��  :  ���������������ظ�һ��������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 0,},		--level 1
	{nCostMana = 0,},		--level 2
	{nCostMana = 0,},		--level 3
	{nCostMana = 0,},		--level 4
	{nCostMana = 0,},		--level 5
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = 4;
    	
   	----------------- ħ������ -------------------------------------------------
   	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- ��������ģʽ
   		ATTRIBUTE_TYPE.CURRENT_MANA,								-- ħ������
   		tSkillData[dwSkillLevel].nManaReplenish,							--����ֵ1
   		0							--����ֵ2
   		);
    --]]    
    ----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);			-- ����Dot
	--skill.BindHot(nBuffID, nBuffLevel);			-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    skill.SetPublicCoolDown(16);	--����CD
    skill.SetNormalCoolDown(1, 84);	--����CD  20��		
	skill.SetCheckCoolDown(1, 444);
   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    --skill.nCostMana      	= 0;					-- �������ĵ�����
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    --skill.nCostManaBasePercent = 34;	-- �������ĵ�����
    
    ----------------- ������� -------------------------------------------------
    skill.bIsAccumulate	= true;				-- �����Ƿ���Ҫ����
    skill.SetSubsectionSkill(1, 1, 373, dwSkillLevel)		-- 1����
    skill.SetSubsectionSkill(2, 2, 374, dwSkillLevel)		-- 2����
    skill.SetSubsectionSkill(3, 3, 375, dwSkillLevel)		-- 3����
    skill.SetSubsectionSkill(4, 4, 376, dwSkillLevel)		-- 4����
    skill.SetSubsectionSkill(5, 5, 377, dwSkillLevel)		-- 5����
    skill.SetSubsectionSkill(6, 6, 378, dwSkillLevel)		-- 6����
    skill.SetSubsectionSkill(7, 7, 379, dwSkillLevel)		-- 7����
    skill.SetSubsectionSkill(8, 8, 380, dwSkillLevel)		-- 8����
    skill.SetSubsectionSkill(9, 9, 381, dwSkillLevel)		-- 9����
    skill.SetSubsectionSkill(10, 10, 382, dwSkillLevel)		-- 10����
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	--skill.nMaxRadius		= 0;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 16; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 160;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    --skill.nStiffFrames 		= 0; 				-- ����ʹ�ú���ɽ�ֱ��֡�� 
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBreakRate      = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--������ħ������Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

end

--������ħ�����Է�Ӧ��ʱ��ִ�нű�,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com