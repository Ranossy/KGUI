---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�Ӽ���_�º���_�±�����Ѫ.lua
-- ����ʱ��:	2015/9/13 13:48:54
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 240, nTherapyRand = 0},
	{ nTherapyBase = 294, nTherapyRand = 0},
	{ nTherapyBase = 351, nTherapyRand = 0},
	{ nTherapyBase = 408, nTherapyRand = 0},
	{ nTherapyBase = 464, nTherapyRand = 0},
	{ nTherapyBase = 867, nTherapyRand = 0},
	{ nTherapyBase = 658, nTherapyRand = 0},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
	--126, -- ����ֵ1
	--dwSkillLevel														-- ����ֵ2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/��/��_�Ӽ���_�º���_�±�����Ѫ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9724, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);			-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);			-- ����Dot
	--skill.BindBuff(1, 593, dwSkillLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

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

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

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
	----------------- Ŀ��Ѫ����� ---------------------------------------------
	--skill.nTargetLifePercentMax    =  100; --Ŀ��Ѫ�������ޣ�0-100
	--skill.nTargetLifePercentMin    =  0  ; --Ŀ��Ѫ��������

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--����4%��Ѫ
	if not player.GetBuff(7913, 1) and player.dwShapeShiftID == 0 then
		player.nCurrentLife = player.nMaxLife * 0.04 + player.nCurrentLife
	end

	--����ɾ��һ��Ч��
	for i = 1, 6 do
		player.DelBuff(9724, i)
	end
	--[[

	local buffid, target, buff
	for i = 1, 6 do
		buff = player.GetBuff(126, i)
		if buff then
			break
		end
	end
	buffid = buff.dwSkillSrcID
	target = GetPlayer(buffid)
	if not target then
		return
	end

	--����Ч��ת��
	if target.GetSkillLevel(14645) == 1 and buffid ~= dwCharacterID then
		target.AddBuff(target.dwID, target.nLevel, 1111, 1)
	end

	--��Ѩ����ظ�2%
	if target.GetSkillLevel(5798) == 1 then
		if not player.GetBuff(7913, 1) and player.dwShapeShiftID == 0 then
			player.nCurrentLife = player.nMaxLife * 0.02 + player.nCurrentLife
		end
	end
	--����ɾ��һ��Ч��
	for i = 1, 6 do
		player.DelBuff(126, i)
	end

	--����û�˵ı���Ч��
	local n = 0
	if target.GetSkillLevel(5798) == 1 then
		for i = 1, 6 do
			buff = player.GetBuff(126, i)
			if buff then
				n = 1
			end
		end
		if n == 0 then
			player.AddBuff(dwCharacterID, player.nLevel, 6316, 1, 1)
		end
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com